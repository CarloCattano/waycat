# waycat

waybar animated icons custom module

# Encoding svgs into fonts

- take svg files and load them into a font editing
- Export to ttf -> put fonts in ~/.local/share/fonts
- use font in custom class in waybar style.css
- run the script on the waybar via custom module

note that font needs to have a defined name and use that name

```
fc-list | grep -i test_font
~/.local/share/fonts/test_font.ttf: Untitled1:style=Regular
```

Untitled1

~/.config/waybar/style.css

```css
#custom-cpucat {
  font-family: "Untitled1", monospace;
  font-size: 42px;
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
B-F Cat running
G-J Cat sleeping

inspired by [https://github.com/win0err/gnome-runcat](gnome-runcat)
