import {defineString} from "firebase-functions/params";

export const bootstrapLocationAdminEmails = defineString(
  "BOOTSTRAP_LOCATION_ADMIN_EMAILS",
  {
    default: "",
    description:
      "Comma-separated emails allowed to bootstrap their own location dashboard admin claim.",
  },
);

export const authWebApiKey = defineString("AUTH_WEB_API_KEY", {
  default: "",
  description:
    "Firebase Web API key used server-side for password auth REST calls.",
});
