script_name("Prefixes")
script_version("1.1")

require 'lib.moonloader'

local sampev = require 'lib.samp.events'
local encoding = require 'encoding'
local imgui = require 'imgui'
local mem = require "memory"
local inicfg = require "inicfg"
local key = require 'vkeys'
encoding.default = 'CP1251'
u8 = encoding.UTF8

local tag = "{00BFFF}[Ìåíþ ïðåôèêñîâ]{FFFFFF}"

local prefixm = imgui.ImBool(false)

local text_buffer = imgui.ImBuffer(256)
local text_buffer2 = imgui.ImBuffer(256)
local text_buffer3 = imgui.ImBuffer(256)
local text_buffer4 = imgui.ImBuffer(256)
local text_buffer5 = imgui.ImBuffer(256)
local text_buffer6 = imgui.ImBuffer(256)
local text_buffer7 = imgui.ImBuffer(256)

local directIni = "moonloader\\PrefSet.ini"
 
local mainIni = inicfg.load(nil, directIni)

function main()
while not  isSampAvailable() do wait(100) end

	_, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
	nick = sampGetPlayerNickname(id)

sampAddChatMessage(tag .. " Ñêðèïò óñïåøíî çàãðóæåí{00BFFF}! ")
sampAddChatMessage(tag .. " {FFFFFF}Àêòèâàöèÿ: {00BFFF}/prefixm ")

sampRegisterChatCommand("prefixm", cmd_prefixm)
sampRegisterChatCommand("prefixhelper", cmd_prefixhelper)
sampRegisterChatCommand("prefixmladm", cmd_prefixmladm)
sampRegisterChatCommand("prefixadm", cmd_prefixadm)
sampRegisterChatCommand("prefixstadm", cmd_prefixstadm)
sampRegisterChatCommand("prefixpga", cmd_prefixpga)
sampRegisterChatCommand("prefixzga", cmd_prefixzga)
sampRegisterChatCommand("prefixga", cmd_prefixga)

  while true do
    wait(0)
     if prefixm.v then
            imgui.ShowCursor = true
        else
            imgui.ShowCursor = false
        end
   end
end

function imgui.OnDrawFrame()


	
  if prefixm.v then 
    imgui.SetNextWindowSize(imgui.ImVec2(600, 350), imgui.Cond.FirstUseEver)
	imgui.SetNextWindowPos(imgui.ImVec2(500, 200), imgui.Cond.FirstUseEver)
	imgui.GetStyle().WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    imgui.Begin(u8'Ïðåôèêñû | 1.1', prefixm, imgui.WindowFlags.NoResize)
	
imgui.CenterText(u8"×òîáû èçáåæàòü áàãà, ïðè çàïèñûâàíèè ïðåôèêñà çàêðîéòå âñå îñòàëüíûå îêíà!")

if imgui.CollapsingHeader(u8"Õåëïåð") then
			imgui.InputText(u8"Ââåäèòå öâåò", text_buffer)
			
				if imgui.Button(u8"Ñîõðàíèòü") then
								mainIni.config.prefixhelper = text_buffer.v
					if inicfg.save(mainIni, directIni) then
					
						sampAddChatMessage("Ñîõðàíåíèå ïðåôèêñà {" .. text_buffer.v .."}'Õåëïåð' {00BFFF}óñïåøíî!", -1)
					end
				end 
			end

if imgui.CollapsingHeader(u8"Ìë.Àäìèíèñòðàòîð") then
			imgui.InputText(u8"Ââåäèòå öâåò", text_buffer2)
				if imgui.Button(u8"Ñîõðàíèòü") then
								mainIni.config.prefixmladm = text_buffer2.v
					if inicfg.save(mainIni, directIni) then
						sampAddChatMessage("Ñîõðàíåíèå ïðåôèêñà {" .. text_buffer2.v .."}'Ìë.Àäìèíèñòðàòîð' {00BFFF}óñïåøíî!", -1)
					end
				end 
				end

if imgui.CollapsingHeader(u8"Àäìèíèñòðàòîð") then
			imgui.InputText(u8"Ââåäèòå öâåò", text_buffer3)
				if imgui.Button(u8"Ñîõðàíèòü") then
								mainIni.config.prefixadm = text_buffer3.v
					if inicfg.save(mainIni, directIni) then
						sampAddChatMessage("Ñîõðàíåíèå ïðåôèêñà {" .. text_buffer3.v .."}'Àäìèíèñòðàòîð' {00BFFF}óñïåøíî!", -1)
					end
				end 
				end

if imgui.CollapsingHeader(u8"Ñòàðøèé-Àäìèíèñòðàòîð") then
			imgui.InputText(u8"Ââåäèòå öâåò", text_buffer4)
				if imgui.Button(u8"Ñîõðàíèòü") then
								mainIni.config.prefixstadm = text_buffer4.v
					if inicfg.save(mainIni, directIni) then
						sampAddChatMessage("Ñîõðàíåíèå ïðåôèêñà {" .. text_buffer4.v .."}'Ñòàðøèé-Àäìèíèñòðàòîð' {00BFFF}óñïåøíî!", -1)
					end
				end 
				end
				
if imgui.CollapsingHeader(u8"Ïîìîùíèê.Ãë-Àäìèíèñòðàòîðà") then
			imgui.InputText(u8"Ââåäèòå öâåò", text_buffer5)
				if imgui.Button(u8"Ñîõðàíèòü") then
								mainIni.config.prefixpga = text_buffer5.v
					if inicfg.save(mainIni, directIni) then
						sampAddChatMessage("Ñîõðàíåíèå ïðåôèêñà {" .. text_buffer5.v .."}'Ïîìîùíèê.Ãë-Àäìèíèñòðàòîðà' {00BFFF}óñïåøíî!", -1)
					end
				end 
				end
				
if imgui.CollapsingHeader(u8"Çàìåñòèòåëü.Ãë-Àäìèíèñòðàòîðà") then
			imgui.InputText(u8"Ââåäèòå öâåò", text_buffer6)
				if imgui.Button(u8"Ñîõðàíèòü") then
								mainIni.config.prefixzga = text_buffer6.v
					if inicfg.save(mainIni, directIni) then
						sampAddChatMessage("Ñîõðàíåíèå ïðåôèêñà {" .. text_buffer6.v .."}'Çàìåñòèòåëü.Ãë-Àäìèíèñòðàòîðà' {00BFFF}óñïåøíî!", -1)
					end
				end 
				end
				
if imgui.CollapsingHeader(u8"Ãëàâíûé-Àäìèíèñòðàòîð") then
			imgui.InputText(u8"Ââåäèòå öâåò", text_buffer7)
				if imgui.Button(u8"Ñîõðàíèòü") then
								mainIni.config.prefixga = text_buffer7.v
					if inicfg.save(mainIni, directIni) then
						sampAddChatMessage("Ñîõðàíåíèå ïðåôèêñà {" .. text_buffer7.v .."}'Ãëàâíûé-Àäìèíèñòðàòîð' {00BFFF}óñïåøíî!", -1)
					end
				end 
				end
				
						if imgui.CollapsingHeader(u8"Ïðîñìîòð âñåõ çíà÷åíèé") then
			imgui.Text(u8"Õåëïåð - " .. mainIni.config.prefixhelper)
			imgui.Text(u8"Ìë.Àäìèíèñòðàòîð - " .. mainIni.config.prefixmladm)
			imgui.Text(u8"Àäìèíèñòðàòîð - " .. mainIni.config.prefixadm)
			imgui.Text(u8"Ñòàðøèé-Àäìèíèñòðàòîð - " .. mainIni.config.prefixstadm)
			imgui.Text(u8"Ïîìîùíèê.Ãë-Àäìèíèñòðàòîðà - " .. mainIni.config.prefixpga)
			imgui.Text(u8"Çàìåñòèòåëü.Ãë-Àäìèíèñòðàòîðà - " .. mainIni.config.prefixzga)
			imgui.Text(u8"Ãëàâíûé-Àäìèíèñòðàòîð - " .. mainIni.config.prefixga)
    if imgui.Button(u8" Ñáðîñèòü âñå çíà÷åíèÿ ", imgui.ImVec2(160,25)) then
		mainIni.config.prefixhelper = text_buffer.v
			if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("Çíà÷åíèå ïðåôèêñà 'Õåëïåð' {00BFFF}óñïåøíî ñáðîøåíî!", -1)
				mainIni.config.prefixmladm = text_buffer2.v
			if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("Çíà÷åíèå ïðåôèêñà 'Ìë.Àäìèíèñòðàòîð' {00BFFF}óñïåøíî ñáðîøåíî!", -1)
					mainIni.config.prefixadm = text_buffer3.v
			if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("Çíà÷åíèå ïðåôèêñà 'Àäìèíèñòðàòîð' {00BFFF}óñïåøíî ñáðîøåíî!", -1)
					mainIni.config.prefixstadm = text_buffer4.v
			if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("Çíà÷åíèå ïðåôèêñà 'Ñòàðøèé-Àäìèíèñòðàòîð' {00BFFF}óñïåøíî ñáðîøåíî!", -1)
					mainIni.config.prefixpga = text_buffer5.v
			if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("Çíà÷åíèå ïðåôèêñà 'Ïîìîùíèê.Ãë-Àäìèíèñòðàòîðà' {00BFFF}óñïåøíî ñáðîøåíî!", -1)
					mainIni.config.prefixzga = text_buffer6.v
			if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("Çíà÷åíèå ïðåôèêñà 'Çàìåñòèòåëü.Ãë-Àäìèíèñòðàòîðà' {00BFFF}óñïåøíî ñáðîøåíî!", -1)
					mainIni.config.prefixga = text_buffer7.v
			if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("Çíà÷åíèå ïðåôèêñà 'Ãëàâíûé-Àäìèíèñòðàòîð' {00BFFF}óñïåøíî ñáðîøåíî!", -1)
   sampAddChatMessage(tag .. " Âñå çíà÷åíèÿ ñáðîøåíû{00BFFF}! ")
	end
	 end
	  end
	   end
	    end
	     end
	      end
	       end
	        end
	imgui.Separator()
	imgui.Text(u8"/prefixhelper - Õåëïåð")
	imgui.Text(u8"/prefixmladm - Ìë.Àäìèíèñòðàòîð")
	imgui.Text(u8"/prefixadm - Àäìèíèñòðàòîð")
	imgui.Text(u8"/prefixstadm - Ñòàðøèé-Àäìèíèñòðàòîð")
	imgui.Text(u8"/prefixpga - Ïîìîùíèê.Ãë-Àäìèíèñòðàòîðà")
	imgui.Text(u8"/prefixzga - Çàìåñòèòåëü.Ãë-Àäìèíèñòðàòîðà")
	imgui.Text(u8"/prefixga - Ãëàâíûé-Àäìèíèñòðàòîð")
	imgui.Separator()
	imgui.TextColoredRGB(u8"Âåðñèÿ ñêðèïòà: {00BFFF}1.1 (alpha)")
	imgui.End()
	  end
	  end

function cmd_prefixm()
prefixm.v = not prefixm.v
imgui.Process = prefixm.v
end

function cmd_prefixhelper(arg)
  sampSendChat("/prefix " .. arg .. " Õåëïåð " .. mainIni.config.prefixhelper)
end

function cmd_prefixmladm(arg)
  sampSendChat("/prefix " .. arg .. " Ìë.Àäìèíèñòðàòîð " .. mainIni.config.prefixmladm)
end

function cmd_prefixadm(arg)
  sampSendChat("/prefix " .. arg .. " Àäìèíèñòðàòîð " .. mainIni.config.prefixadm)
end

function cmd_prefixstadm(arg)
  sampSendChat("/prefix " .. arg .. " Ñòàðøèé-Àäìèíèñòðàòîð " .. mainIni.config.prefixstadm)
end

function cmd_prefixpga(arg)
  sampSendChat("/prefix " .. arg .. " Ïîìîùíèê.Ãë-Àäìèíèñòðàòîðà " .. mainIni.config.prefixpga)
end

function cmd_prefixzga(arg)
  sampSendChat("/prefix " .. arg .. " Çàìåñòèòåëü.Ãë-Àäìèíèñòðàòîðà " .. mainIni.config.prefixzga)
end

function cmd_prefixga(arg)
  sampSendChat("/prefix " .. arg .. " Ãëàâíûé-Àäìèíèñòðàòîð " .. mainIni.config.prefixga)
end

function imgui.CenterText(text)
    local width = imgui.GetWindowWidth()
    local calc = imgui.CalcTextSize(text)
    imgui.SetCursorPosX( width / 2 - calc.x / 2 )
    imgui.Text(text)
end

function imgui.TextColoredRGB(text)
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4

    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end

    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImColor(r, g, b, a):GetVec4()
    end

    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], text[i])
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else imgui.Text(w) end
        end
    end

    render_text(text)
end

function colorm() 
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2

    style.WindowPadding = ImVec2(15, 15)
    style.WindowRounding = 15.0
    style.FramePadding = ImVec2(5, 5)
    style.ItemSpacing = ImVec2(12, 8)
    style.ItemInnerSpacing = ImVec2(8, 6)
    style.IndentSpacing = 25.0
    style.ScrollbarSize = 15.0
    style.ScrollbarRounding = 15.0
    style.GrabMinSize = 15.0
    style.GrabRounding = 7.0
    style.ChildWindowRounding = 8.0
    style.FrameRounding = 6.0
  

      colors[clr.Text] = ImVec4(0.95, 0.96, 0.98, 1.00)
      colors[clr.TextDisabled] = ImVec4(0.36, 0.42, 0.47, 1.00)
      colors[clr.WindowBg] = ImVec4(0.11, 0.15, 0.17, 1.00)
      colors[clr.ChildWindowBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
      colors[clr.PopupBg] = ImVec4(0.08, 0.08, 0.08, 0.94)
      colors[clr.Border] = ImVec4(0.43, 0.43, 0.50, 0.50)
      colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
      colors[clr.FrameBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.FrameBgHovered] = ImVec4(0.12, 0.20, 0.28, 1.00)
      colors[clr.FrameBgActive] = ImVec4(0.09, 0.12, 0.14, 1.00)
      colors[clr.TitleBg] = ImVec4(0.09, 0.12, 0.14, 0.65)
      colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.51)
      colors[clr.TitleBgActive] = ImVec4(0.08, 0.10, 0.12, 1.00)
      colors[clr.MenuBarBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
      colors[clr.ScrollbarBg] = ImVec4(0.02, 0.02, 0.02, 0.39)
      colors[clr.ScrollbarGrab] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.ScrollbarGrabHovered] = ImVec4(0.18, 0.22, 0.25, 1.00)
      colors[clr.ScrollbarGrabActive] = ImVec4(0.09, 0.21, 0.31, 1.00)
      colors[clr.ComboBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.CheckMark] = ImVec4(0.28, 0.56, 1.00, 1.00)
      colors[clr.SliderGrab] = ImVec4(0.28, 0.56, 1.00, 1.00)
      colors[clr.SliderGrabActive] = ImVec4(0.37, 0.61, 1.00, 1.00)
      colors[clr.Button] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.ButtonHovered] = ImVec4(0.28, 0.56, 1.00, 1.00)
      colors[clr.ButtonActive] = ImVec4(0.06, 0.53, 0.98, 1.00)
      colors[clr.Header] = ImVec4(0.20, 0.25, 0.29, 0.55)
      colors[clr.HeaderHovered] = ImVec4(0.26, 0.59, 0.98, 0.80)
      colors[clr.HeaderActive] = ImVec4(0.26, 0.59, 0.98, 1.00)
      colors[clr.ResizeGrip] = ImVec4(0.26, 0.59, 0.98, 0.25)
      colors[clr.ResizeGripHovered] = ImVec4(0.26, 0.59, 0.98, 0.67)
      colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
      colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
      colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
      colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
      colors[clr.PlotLines] = ImVec4(0.61, 0.61, 0.61, 1.00)
      colors[clr.PlotLinesHovered] = ImVec4(1.00, 0.43, 0.35, 1.00)
      colors[clr.PlotHistogram] = ImVec4(0.90, 0.70, 0.00, 1.00)
      colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
      colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
      colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
end
colorm()
