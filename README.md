Radiant 2d Engine
=================

Include in adria based project
------------------------------

- Add radiant directory to project paths, i.e. via `"paths": [ "../radiantlib/" ]` in abc-file
- `require('radiant')` or individual features, i.e. `var Color = require('radiant/color');`

Build standalone js library
---------------------------

`adria -c`

Outputs common.js compatible radiant.js to bin/

Run demo server
---------------

`cd demo`  
`adria -c server.abc`  
`./server.js`

Starts server on http://localhost/ and continuously monitors changes in demo files (playground).
