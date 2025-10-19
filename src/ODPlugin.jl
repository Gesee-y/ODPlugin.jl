#######################################################################################################################
################################################ OUTDOORS PLUGIN ######################################################
#######################################################################################################################

module ODPlugin

using Cruise
using Outdoors

const ODPLUGIN = CRPlugin()
const APP = ODApp()

add_system!(ODPlugin)

################################################# PLUGIN LIFECYCLE ####################################################

function Cruise.awake!(n::CRPluginNode{ODApp})
	InitOutdoor()
	setstatus(n, PLUGIN_OK)
end

function Cruise.update!(n::CRPluginNode{ODApp})
	GetEvents(n.obj)
end

function Cruise.shutdown!(n::CRPluginNode{ODApp})
	QuitOutdoor()
	setstatus(n, PLUGIN_OFF)
end

################################################## OTHER FUNCTIONS #####################################################

function Outdoors.CreateWindow(app::CruiseApp, style, args...)
	InitStyle(style)
	return CreateWindow(APP, style, args...)
end