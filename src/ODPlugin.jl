#######################################################################################################################
################################################ OUTDOORS PLUGIN ######################################################
#######################################################################################################################

module ODPlugin

export ODPLUGIN

using Reexport
using Cruise
@reexport using Outdoors

const ODPLUGIN = CRPlugin()
const APP = ODApp()
PHASE = :preupdate

add_system!(ODPlugin, APP)

################################################# PLUGIN LIFECYCLE ####################################################

function Cruise.awake!(n::CRPluginNode{ODApp})
	InitOutdoor()
	setstatus(n, PLUGIN_OK)
end

function Cruise.update!(n::CRPluginNode{ODApp})
	EventLoop(n.obj)
end

function Cruise.shutdown!(n::CRPluginNode{ODApp})
	QuitOutdoor()
	setstatus(n, PLUGIN_OFF)
end

################################################## OTHER FUNCTIONS #####################################################

function Outdoors.CreateWindow(app::CruiseApp, style::Type{<:AbstractStyle}, args...)
	InitStyle(style)
	return CreateWindow(APP, style, args...)
end