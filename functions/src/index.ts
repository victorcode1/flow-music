import "./config/firebase";

export {
  authCurrentUser,
  authGoogleLogin,
  authLogin,
  authPasswordReset,
  authRefreshSession,
  authRegister,
} from "./modules/auth";
export {
  bootstrapLocationDashboardAdmin,
  deleteAllUsersLocationHistory,
  locationApi,
  scheduledLocationHistoryCleanup,
  setGlobalLocationUpdateInterval,
  setLocationDashboardAccess,
  setLocationHistoryCleanupSchedule,
} from "./modules/location";
export {scheduledAnonymousUserCleanup} from "./modules/maintenance";
export {userDataApi} from "./modules/user-data";
export {userPresenceApi} from "./modules/user-presence";
