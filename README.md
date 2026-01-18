# waycat

![catskull_18_01_08_20](https://github.com/user-attachments/assets/5d333cf8-326b-43f0-be5a-af816d49dc16)


[waybar](https://github.com/Alexays/Waybar) animated icons custom module

# Encoding svgs into fonts

- take svg files and load them into a font editing
- Export to ttf -> put fonts in ~/.local/share/fonts
- use font in custom class in waybar style.css
- run the script on the waybar via custom module

~/.config/waybar/style.css

```css
#custom-cpucat {
  font-family: "Waycat", monospace;
  font-size: 32px;
  font-weight: bold;
  color: white;
  padding-left: 8px;
  padding-right: 8px;
}
```

- put the catloop.sh script in ~/scripts or any other path you like
    waybar will call it here and it will run endlessly
```json
	"custom/cpucat": {
        "exec":"~/scripts/catloop.sh",
```

example test font:
A-E Cat running
G-J Cat sleeping

inspired by [https://github.com/win0err/gnome-runcat](gnome-runcat)


## Examples
A gnome-cat cpu monitor is provided and a Skull.

