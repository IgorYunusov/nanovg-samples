-- premake5.lua
local build_dir="build_".._ACTION

location(build_dir)

solution "nanovg-samples"
do
    configurations { "Debug", "Release" }
    platforms { "Win64", "Win32" }
end

filter "configurations:Debug"
do
    defines { "DEBUG", "_DEBUG" }
    flags { "Symbols" }
end

filter "configurations:Release"
do
    defines { "NDEBUG" }
    optimize "On"
end

filter { "platforms:Win64" }
   architecture "x64"
filter { "platforms:Win32" }
   architecture "x32"

filter { "platforms:Win64", "configurations:Debug" }
    targetdir(build_dir.."/Win64_Debug")
filter { "platforms:Win64", "configurations:Release" }
    targetdir(build_dir.."/Win64_Release")
filter { "platforms:Win32", "configurations:Debug" }
    targetdir(build_dir.."/Win32_Debug")
filter { "platforms:Win32", "configurations:Release" }
    targetdir(build_dir.."/Win32_Release")

filter { "action:vs*" }
    defines { 
        "_CRT_SECURE_NO_WARNINGS",
    }

filter {}
    defines { 
        "NVG_SHARED",
    }

include "nanovg-example_gl2"
include "nanovg"
--include "nanogui"

