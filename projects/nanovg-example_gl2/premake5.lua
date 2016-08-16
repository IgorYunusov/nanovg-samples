project "nanovg-example_gl2"
do
    kind "ConsoleApp"
    --kind "WindowedApp"
    --kind "StaticLib"
    --kind "SharedLib"
    language "C"
    --language "C++"

    flags{ 
        --"WinMain" 
    }
    files { "*.h", "*.c" }
    includedirs {
        "../nanovg",
    }
    defines {
        "NANOVG_GLEW",
    }
    buildoptions {}
    libdirs {}
    links {
        "nanovg",
        "glfw3", "gdi32", "winmm", "user32", "glew32", "glu32","opengl32", "kernel32" 
    }
end

