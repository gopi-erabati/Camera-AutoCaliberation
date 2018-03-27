# Camera-AutoCaliberation

Camera calibration is the process of estimating parameters of the camera using images of a special calibration pattern. The parameters include camera intrinsics, distortion coefficients, and camera extrinsics. Camera auto-calibration is the process of determining internal camera parameters directly from multiple uncalibrated images of unstructured scenes. In contrast to classic camera calibration, auto-calibration does not require any special calibration objects in the scene.

Why it's important?
For instance, in 3D reconstruction, the recovery of the calibration parameters of the cameras is significant since it provides metric information about the observed scene, e.g., measures of angles and ratios of distances. Auto-calibration enables the estimation of the camera parameters without using a calibration device (e.g., checkerboard), but by enforcing simple constraints on the camera parameters, such as constant intrinsic parameters in multiple images, known principal point, known pixel shape, etc.
