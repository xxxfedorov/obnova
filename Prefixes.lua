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

local tag = "{00BFFF}[Меню префиксов]{FFFFFF}"

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

autoupdate("https://raw.githubusercontent.com/xxxfedorov/obnova/main/PrefixesUP.json", '['..string.upper(thisScript().name)..']: ', "https://raw.githubusercontent.com/xxxfedorov/obnova/main/PrefixesUP.json")

while not  isSampAvailable() do wait(100) end

	_, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
	nick = sampGetPlayerNickname(id)

sampAddChatMessage(tag .. " Скрипт успешно загружен{00BFFF}! ")
sampAddChatMessage(tag .. " {FFFFFF}Активация: {00BFFF}/prefixm ")

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
    imgui.Begin(u8'Префиксы | 1.1', prefixm, imgui.WindowFlags.NoResize)
	
imgui.CenterText(u8"Чтобы избежать бага, при записывании префикса закройте все остальные окна!")

if imgui.CollapsingHeader(u8"Хелпер") then
			imgui.InputText(u8"Введите цвет", text_buffer)
			
				if imgui.Button(u8"Сохранить") then
								mainIni.config.prefixhelper = text_buffer.v
					if inicfg.save(mainIni, directIni) then
					
						sampAddChatMessage("Сохранение префикса {" .. text_buffer.v .."}'Хелпер' {00BFFF}успешно!", -1)
					end
				end 
			end

if imgui.CollapsingHeader(u8"Мл.Администратор") then
			imgui.InputText(u8"Введите цвет", text_buffer2)
				if imgui.Button(u8"Сохранить") then
								mainIni.config.prefixmladm = text_buffer2.v
					if inicfg.save(mainIni, directIni) then
						sampAddChatMessage("Сохранение префикса {" .. text_buffer2.v .."}'Мл.Администратор' {00BFFF}успешно!", -1)
					end
				end 
				end

if imgui.CollapsingHeader(u8"Администратор") then
			imgui.InputText(u8"Введите цвет", text_buffer3)
				if imgui.Button(u8"Сохранить") then
								mainIni.config.prefixadm = text_buffer3.v
					if inicfg.save(mainIni, directIni) then
						sampAddChatMessage("Сохранение префикса {" .. text_buffer3.v .."}'Администратор' {00BFFF}успешно!", -1)
					end
				end 
				end

if imgui.CollapsingHeader(u8"Старший-Администратор") then
			imgui.InputText(u8"Введите цвет", text_buffer4)
				if imgui.Button(u8"Сохранить") then
								mainIni.config.prefixstadm = text_buffer4.v
					if inicfg.save(mainIni, directIni) then
						sampAddChatMessage("Сохранение префикса {" .. text_buffer4.v .."}'Старший-Администратор' {00BFFF}успешно!", -1)
					end
				end 
				end
				
if imgui.CollapsingHeader(u8"Помощник.Гл-Администратора") then
			imgui.InputText(u8"Введите цвет", text_buffer5)
				if imgui.Button(u8"Сохранить") then
								mainIni.config.prefixpga = text_buffer5.v
					if inicfg.save(mainIni, directIni) then
						sampAddChatMessage("Сохранение префикса {" .. text_buffer5.v .."}'Помощник.Гл-Администратора' {00BFFF}успешно!", -1)
					end
				end 
				end
				
if imgui.CollapsingHeader(u8"Заместитель.Гл-Администратора") then
			imgui.InputText(u8"Введите цвет", text_buffer6)
				if imgui.Button(u8"Сохранить") then
								mainIni.config.prefixzga = text_buffer6.v
					if inicfg.save(mainIni, directIni) then
						sampAddChatMessage("Сохранение префикса {" .. text_buffer6.v .."}'Заместитель.Гл-Администратора' {00BFFF}успешно!", -1)
					end
				end 
				end
				
if imgui.CollapsingHeader(u8"Главный-Администратор") then
			imgui.InputText(u8"Введите цвет", text_buffer7)
				if imgui.Button(u8"Сохранить") then
								mainIni.config.prefixga = text_buffer7.v
					if inicfg.save(mainIni, directIni) then
						sampAddChatMessage("Сохранение префикса {" .. text_buffer7.v .."}'Главный-Администратор' {00BFFF}успешно!", -1)
					end
				end 
				end
				
						if imgui.CollapsingHeader(u8"Просмотр всех значений") then
			imgui.Text(u8"Хелпер - " .. mainIni.config.prefixhelper)
			imgui.Text(u8"Мл.Администратор - " .. mainIni.config.prefixmladm)
			imgui.Text(u8"Администратор - " .. mainIni.config.prefixadm)
			imgui.Text(u8"Старший-Администратор - " .. mainIni.config.prefixstadm)
			imgui.Text(u8"Помощник.Гл-Администратора - " .. mainIni.config.prefixpga)
			imgui.Text(u8"Заместитель.Гл-Администратора - " .. mainIni.config.prefixzga)
			imgui.Text(u8"Главный-Администратор - " .. mainIni.config.prefixga)
    if imgui.Button(u8" Сбросить все значения ", imgui.ImVec2(160,25)) then
		mainIni.config.prefixhelper = text_buffer.v
			if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("Значение префикса 'Хелпер' {00BFFF}успешно сброшено!", -1)
				mainIni.config.prefixmladm = text_buffer2.v
			if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("Значение префикса 'Мл.Администратор' {00BFFF}успешно сброшено!", -1)
					mainIni.config.prefixadm = text_buffer3.v
			if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("Значение префикса 'Администратор' {00BFFF}успешно сброшено!", -1)
					mainIni.config.prefixstadm = text_buffer4.v
			if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("Значение префикса 'Старший-Администратор' {00BFFF}успешно сброшено!", -1)
					mainIni.config.prefixpga = text_buffer5.v
			if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("Значение префикса 'Помощник.Гл-Администратора' {00BFFF}успешно сброшено!", -1)
					mainIni.config.prefixzga = text_buffer6.v
			if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("Значение префикса 'Заместитель.Гл-Администратора' {00BFFF}успешно сброшено!", -1)
					mainIni.config.prefixga = text_buffer7.v
			if inicfg.save(mainIni, directIni) then
			sampAddChatMessage("Значение префикса 'Главный-Администратор' {00BFFF}успешно сброшено!", -1)
   sampAddChatMessage(tag .. " Все значения сброшены{00BFFF}! ")
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
	imgui.Text(u8"/prefixhelper - Хелпер")
	imgui.Text(u8"/prefixmladm - Мл.Администратор")
	imgui.Text(u8"/prefixadm - Администратор")
	imgui.Text(u8"/prefixstadm - Старший-Администратор")
	imgui.Text(u8"/prefixpga - Помощник.Гл-Администратора")
	imgui.Text(u8"/prefixzga - Заместитель.Гл-Администратора")
	imgui.Text(u8"/prefixga - Главный-Администратор")
	imgui.Separator()
	imgui.TextColoredRGB(u8"Версия скрипта: {00BFFF}1.1 (alpha)")
	imgui.End()
	  end
	  end

function cmd_prefixm()
prefixm.v = not prefixm.v
imgui.Process = prefixm.v
end

function cmd_prefixhelper(arg)
  sampSendChat("/prefix " .. arg .. " Хелпер " .. mainIni.config.prefixhelper)
end

function cmd_prefixmladm(arg)
  sampSendChat("/prefix " .. arg .. " Мл.Администратор " .. mainIni.config.prefixmladm)
end

function cmd_prefixadm(arg)
  sampSendChat("/prefix " .. arg .. " Администратор " .. mainIni.config.prefixadm)
end

function cmd_prefixstadm(arg)
  sampSendChat("/prefix " .. arg .. " Старший-Администратор " .. mainIni.config.prefixstadm)
end

function cmd_prefixpga(arg)
  sampSendChat("/prefix " .. arg .. " Помощник.Гл-Администратора " .. mainIni.config.prefixpga)
end

function cmd_prefixzga(arg)
  sampSendChat("/prefix " .. arg .. " Заместитель.Гл-Администратора " .. mainIni.config.prefixzga)
end

function cmd_prefixga(arg)
  sampSendChat("/prefix " .. arg .. " Главный-Администратор " .. mainIni.config.prefixga)
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

function autoupdate(json_url, prefix, url)
  local dlstatus = require('moonloader').download_status
  local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
  if doesFileExist(json) then os.remove(json) end
  downloadUrlToFile(json_url, json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, 'r')
          if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            updateversion = info.latest
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(function(prefix)
                local dlstatus = require('moonloader').download_status
                local color = -1
                sampAddChatMessage((prefix..'Обнаружено обновление. Пытаюсь обновиться c '..thisScript().version..' на '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('Загружено %d из %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('Загрузка обновления завершена.')
                      sampAddChatMessage((prefix..'Обновление завершено!'), color)
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'Обновление прошло неудачно. Запускаю устаревшую версию..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              print('v'..thisScript().version..': Обновление не требуется.')
            end
          end
        else
          print('v'..thisScript().version..': Не могу проверить обновление. Смиритесь или проверьте самостоятельно на '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
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