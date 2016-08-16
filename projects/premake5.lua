-- premake5.lua
local build_dir="build_".._ACTION
local glew_dir="glew-2.0.0"

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
    buildoptions {
        "/wd4819",
    }

filter {}
    defines { 
        "NVG_SHARED",
    }
    includedirs {
        glew_dir.."/include",
        "glfw/include",
    }

include "nanovg-example_gl2"
include "nanovg"
--include "nanogui"
--
project "glfw3"
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
    files { 
        "glfw/src/*.c", 
        "glfw/include/GLFW/*.h",
    }
    excludes {
        "glfw/src/x11_*",
        "glfw/src/wl_*",
        "glfw/src/posix_*",
        "glfw/src/mir_*",
        "glfw/src/linux_*",
        "glfw/src/cocoa_*",
        "glfw/src/glx_*",
    }
    includedirs {}
    defines {
        "_GLFW_WIN32",
        "_GLFW_BUILD_DLL",
    }
    buildoptions {}
    libdirs {}
    links {
        "gdi32",
    }
end

project "glew32"
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
    files { 
        glew_dir.."/src/glew.c", 
        glew_dir.."/include/GL/*.h", 
    }
    excludes {
    }
    includedirs {
        glew_dir.."/include",
    }
    defines {
        "GLEW_BUILD",
    }
    buildoptions {}
    libdirs {}
    links {
        "OpenGL32",
    }
end

