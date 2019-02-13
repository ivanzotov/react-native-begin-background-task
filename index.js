import { Platform, NativeModules } from 'react-native';

export const beginBackgroundTask = async () => {
  if (Platform.OS === 'ios') {
    return await NativeModules.RNBeginBackgroundTask.begin()
  }
}

export const endBackgroundTask = async (backgroundTaskId) => {
  if (Platform.OS === 'ios') {
    await NativeModules.RNBeginBackgroundTask.end(backgroundTaskId)
  }
}

export const backgroundTimeRemaining = async () => {
  if (Platform.OS === 'ios') {
    return await NativeModules.RNBeginBackgroundTask.remaining()
  }
}
