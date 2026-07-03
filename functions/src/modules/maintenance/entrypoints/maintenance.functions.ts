import {logger} from "firebase-functions";
import {onSchedule} from "firebase-functions/v2/scheduler";

import {AnonymousUserCleanupService} from "../application/anonymous-user-cleanup-service";

const cleanupService = new AnonymousUserCleanupService();

export const scheduledAnonymousUserCleanup = onSchedule(
  {
    region: "us-central1",
    memory: "512MiB",
    timeoutSeconds: 540,
    schedule: "0 3 * * 1",
    timeZone: "America/Panama",
    retryCount: 3,
    maxRetrySeconds: 600,
  },
  async (event) => {
    const config = await cleanupService.readConfig();
    if (!config.enabled) {
      logger.info("Scheduled anonymous user cleanup skipped: disabled", {
        jobName: event.jobName,
        scheduleTime: event.scheduleTime,
      });
      return;
    }

    const inactiveSince = new Date(
      Date.now() - config.inactivityDays * 24 * 60 * 60 * 1000,
    );
    const result = await cleanupService.deleteInactiveAnonymousUsers({
      inactiveSince,
    });
    await cleanupService.markRun(result);
    logger.info("Scheduled anonymous user cleanup completed", {
      jobName: event.jobName,
      scheduleTime: event.scheduleTime,
      inactiveSince: inactiveSince.toISOString(),
      inactivityDays: config.inactivityDays,
      ...result,
    });
  },
);
