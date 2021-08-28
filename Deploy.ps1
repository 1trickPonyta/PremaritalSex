$path = "D:\Program Files (x86)\Steam\steamapps\common\RimWorld\Mods\PremaritalSex"

Copy-Item "$path\About\PublishedFileId.txt" "$PSScriptRoot\About"
Remove-Item -Recurse "$path\*"
mkdir $path
@(
	".",
	"1.2",
	"1.3"
) | %{
	$base = $_
	@(
		"About",
		"Assemblies",
		"Defs",
		"Languages",
		"Patches",
		"Source",
		"Textures"
	) | %{ Copy-Item -Recurse "$PSScriptRoot\$base\$_" "$path\$base\$_" }
}
