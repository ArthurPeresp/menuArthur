-- menuBrainrott.lua
-- Refatoração completa para Lua moderna e legível, mantendo a lógica de menu e funcionalidades principais

local menuBrainrott = {}

-- Utilitários bitwise (garantir compatibilidade com LuaJIT ou Lua 5.3+)
local bit32 = bit32 or require("bit32")
menuBrainrott.countrz = bit32.countrz
menuBrainrott.countlz = bit32.countlz
menuBrainrott.lshift  = bit32.lshift
menuBrainrott.band    = bit32.band
menuBrainrott.bxor    = bit32.bxor
menuBrainrott.bor     = bit32.bor
menuBrainrott.rshift  = bit32.rshift
menuBrainrott.bnot    = bit32.bnot
menuBrainrott.lrotate = bit32.lrotate
menuBrainrott.rrotate = bit32.rrotate

-- Utilidades de string
menuBrainrott.byte = string.byte
menuBrainrott.sub  = string.sub
menuBrainrott.char = string.char

-- Funções de manipulação de ambiente
menuBrainrott.unpack  = unpack or table.unpack

-- Função para estilização do menu no console (pode ser adaptada para UI)
function menuBrainrott:printMenu(items, title)
    title = title or "Menu"
    local line = ("="):rep(#title + 8)
    print(line)
    print("   ..:: "..title.." ::..")
    print(line)
    for i, item in ipairs(items) do
        print(string.format(" [%d] %s", i, item.label or tostring(item)))
    end
    print(line)
end

-- Função para coletar a escolha do usuário
function menuBrainrott:getChoice(num)
    io.write("Escolha uma opção: ")
    local choice = tonumber(io.read())
    if choice and choice >= 1 and choice <= num then
        return choice
    end
    print("[!] Opção inválida.")
    return nil
end

-- Função principal do menu, estilizando e processando opções
function menuBrainrott:show(options, title)
    assert(type(options) == "table" and #options > 0, "Opções de menu no formato de lista")
    while true do
        self:printMenu(options, title)
        local choice = self:getChoice(#options)
        if choice then
            local selected = options[choice]
            if type(selected.action) == "function" then
                local status, msg = pcall(selected.action)
                if not status then print("[Erro na ação]:", msg) end
            end
            if selected.exit then
                break
            end
        end
    end
end

-- Exemplo de uso:
--[[
local menu = require("menuBrainrott")
menu:show({
    { label = "Iniciar", action = function() print("Iniciando...") end },
    { label = "Opções", action = function() print("Exibindo opções...") end },
    { label = "Sair", action = function() print("Saindo...") end, exit = true }
}, "Meu Script Menu")
]]

return menuBrainrott