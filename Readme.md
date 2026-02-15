# Springfield Armory Echelon 9mm — Optics Cover Plate

Small OpenSCAD project to generate a tapered cover plate with countersunk screw holes and edge notches.

## Files
- `echelon_cover_plate.scad` — main model (prismoid + holes + notches).
- `echelon_cover_plate_v1.stl` - STL file for the first iteration
- `echelon_cover_plate.3mf` - Orca project file for printing with rapid petg

## Prerequisite
You will need the BOSL2 library installed on your system

## Quick start
1. Open `echelon_cover_plate.scad` in OpenSCAD.
2. Use the Customizer (or edit the variables at the top of the file) to change dimensions.
3. Export STL (CLI):

```bash
openscad -o /tmp/echelon.stl echelon_cover_plate.scad
```

If `openscad` CLI is missing on macOS, install via Homebrew Cask or enable the CLI from the OpenSCAD app.

## Important variables (top of `echelon_cover_plate.scad`)
- `bottom_w`, `top_w` — bottom/top widths (X axis).
- `length` — part depth (Y axis), front = `y=0`.
- `height` — thickness (Z axis).
- `hole_gutter` — X offset from side for screw holes.
- `hole_offset` — distance from the BACK edge; hole Y = `length - hole_offset`.
- `screw_size` — screw spec string passed to the screw helper.
- `notch_width`, `notch_length`, `notch_offsets` — notch geometry/positions.

## License
See LICENSE file