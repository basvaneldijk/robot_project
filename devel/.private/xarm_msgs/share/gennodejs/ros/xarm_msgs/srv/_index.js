
"use strict";

let FtIdenLoad = require('./FtIdenLoad.js')
let SetDigitalIO = require('./SetDigitalIO.js')
let MoveVelocity = require('./MoveVelocity.js')
let SetLoad = require('./SetLoad.js')
let FtCaliLoad = require('./FtCaliLoad.js')
let SetMultipleInts = require('./SetMultipleInts.js')
let MoveVelo = require('./MoveVelo.js')
let SetControllerAnalogIO = require('./SetControllerAnalogIO.js')
let GetInt32 = require('./GetInt32.js')
let GetErr = require('./GetErr.js')
let SetFloat32 = require('./SetFloat32.js')
let Move = require('./Move.js')
let GetDigitalIO = require('./GetDigitalIO.js')
let TCPOffset = require('./TCPOffset.js')
let GripperState = require('./GripperState.js')
let GetAnalogIO = require('./GetAnalogIO.js')
let SetToolModbus = require('./SetToolModbus.js')
let SetModbusTimeout = require('./SetModbusTimeout.js')
let ConfigToolModbus = require('./ConfigToolModbus.js')
let PlayTraj = require('./PlayTraj.js')
let GetSetModbusData = require('./GetSetModbusData.js')
let MoveAxisAngle = require('./MoveAxisAngle.js')
let ClearErr = require('./ClearErr.js')
let GripperConfig = require('./GripperConfig.js')
let GetControllerDigitalIO = require('./GetControllerDigitalIO.js')
let Call = require('./Call.js')
let SetString = require('./SetString.js')
let GripperMove = require('./GripperMove.js')
let VacuumGripperCtrl = require('./VacuumGripperCtrl.js')
let SetAxis = require('./SetAxis.js')
let SetInt16 = require('./SetInt16.js')
let GetFloat32List = require('./GetFloat32List.js')

module.exports = {
  FtIdenLoad: FtIdenLoad,
  SetDigitalIO: SetDigitalIO,
  MoveVelocity: MoveVelocity,
  SetLoad: SetLoad,
  FtCaliLoad: FtCaliLoad,
  SetMultipleInts: SetMultipleInts,
  MoveVelo: MoveVelo,
  SetControllerAnalogIO: SetControllerAnalogIO,
  GetInt32: GetInt32,
  GetErr: GetErr,
  SetFloat32: SetFloat32,
  Move: Move,
  GetDigitalIO: GetDigitalIO,
  TCPOffset: TCPOffset,
  GripperState: GripperState,
  GetAnalogIO: GetAnalogIO,
  SetToolModbus: SetToolModbus,
  SetModbusTimeout: SetModbusTimeout,
  ConfigToolModbus: ConfigToolModbus,
  PlayTraj: PlayTraj,
  GetSetModbusData: GetSetModbusData,
  MoveAxisAngle: MoveAxisAngle,
  ClearErr: ClearErr,
  GripperConfig: GripperConfig,
  GetControllerDigitalIO: GetControllerDigitalIO,
  Call: Call,
  SetString: SetString,
  GripperMove: GripperMove,
  VacuumGripperCtrl: VacuumGripperCtrl,
  SetAxis: SetAxis,
  SetInt16: SetInt16,
  GetFloat32List: GetFloat32List,
};
