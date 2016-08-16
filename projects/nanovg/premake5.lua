project "nanovg"
do
    --kind "ConsoleApp"
    --kind "WindowedApp"
    --kind "StaticLib"
    kind "SharedLib"
    language "C"
    --language "C++"

    flags{ 
        --"WinMain" 
    }
    files { "*.h", "*.c" }
    includedirs {}
    defines {
        "NVG_SHARED",
        "NVG_BUILD",
    }
    buildoptions {}
    libdirs {}
    links {}
end

