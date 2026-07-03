export type SetLocationDashboardAccessRequest = {
  email?: unknown;
  enabled?: unknown;
};

export type SetLocationHistoryCleanupScheduleRequest = {
  enabled?: unknown;
  hour?: unknown;
  minute?: unknown;
  timezone?: unknown;
};

export type SetGlobalLocationUpdateIntervalRequest = {
  seconds?: unknown;
  minutes?: unknown;
};

export type AdminAccessResponse = {
  uid: string;
  email?: string;
  claims: Record<string, unknown>;
};

export type SetGlobalLocationUpdateIntervalResponse = {
  seconds: number;
  minutes: number;
  updatedCount: number;
};

export type DeleteLocationHistoryResponse = {
  deletedCount: number;
};

export type LocationHistoryCleanupSchedule = {
  enabled: boolean;
  hour: number;
  minute: number;
  timezone: string;
  lastRunKey?: string;
};

export type CallableAuthContext = {
  uid: string;
  token: Record<string, unknown>;
} | null | undefined;
