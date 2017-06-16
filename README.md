# Matlab Euler Angles

This modest collection of files implements 3D kinematics calculations of the form
included in works such as *Introduction to Robotics* by John J. Craig.

A far more comprehensive package can be found in Peter Corke's "[Robotics Toolbox for Matlab][1]".
This work is intended to complement such work, not replace; in the present code,
interfaces are provided for didactic purposes / syntactic sugar rather than efficiency.
The scope of this work is also far more limited to basic geometry / kinematics.

[1]: https://github.com/petercorke/robotics-toolbox-matlab

# Overview

* `eulang2rotmat.m` -- calculates the 3x3 rotation matrix from an input set of Euler angles (i.e., *non-fixed* reference frames) in specified order
* `rotmat2eulang.m` -- calculates the Euler angles in specified order from a rotation matrix
* `planevec2axes.m` -- calculates coordinate system unit vectors (or rotation matrix, etc.) from two vectors that form a plane
* `plot_frame.m`    -- plot a 3D coordinate system



Documentation to be improved!


## License

Copyright (c) 2017 Will Robertson, wspr 81 at gmail dot com

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
