project "ImGui"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"

	targetdir ("bin/%{cfg.buildcfg}")
	objdir ("bin-obj/%{cfg.buildcfg}")

	includedirs
	{
		"./",
		"backends",
		
		-- Necessary for vulkan
		"%{VULKAN_SDK}/Include/"
		-- "%{LibraryDir.Vulkan}"
	}

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui_internal.h",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui.cpp",
		"imgui_demo.cpp",
		"imgui_draw.cpp",
		"imgui_tables.cpp",
		"imgui_widgets.cpp",

		-- Selected backend: Vulkan
		"backends/imgui_impl_glfw.h",
		"backends/imgui_impl_vulkan.h",
		"backends/imgui_impl_vulkan.cpp"
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

	filter "system:linux"
		systemversion "latest"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"