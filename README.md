# react-native-begin-background-task

## Getting started

`$ npm install react-native-begin-background-task --save`

### Mostly automatic installation

`$ react-native link react-native-begin-background-task`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-begin-background-task` and add `RNBeginBackgroundTask.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNBeginBackgroundTask.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

## Usage
```javascript
import { beginBackgroundTask, endBackgroundTask } from 'react-native-begin-background-task';

// ...
const backgroundTaskId = await beginBackgroundTask();
// ...
await endBackgroundTask(backgroundTaskId)
```
