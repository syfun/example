# Anaconda

## virtualenv config

1. project => save project as ...

```json
{
	"build_systems":
	[
		{
			"file_regex": "^[ ]*File \"(...*?)\", line ([0-9]*)",
			"name": "Anaconda Python Builder",
			"selector": "source.python",
			"shell_cmd": "\".venv/bin/python\" -u \"$file\""
		}
	],
	"folders":
	[
		{
			"path": "."
		}
	],
	"settings":
	{
		"python_interpreter": ".venv/bin/python"
	}
}
```