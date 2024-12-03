math.randomseed(os.time())
-- Função para gerar uma senha segura
local function generatePassword(length, useSpecial, useNumbers)
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local specialChars = "!@#$%^&*()-_=+<>?"
    local numbers = "0123456789"

    if useSpecial then chars = chars .. specialChars end
    if useNumbers then chars = chars .. numbers end

    local password = ""
    for _ = 1, length do
        local index = math.random(1, #chars)
        password = password .. chars:sub(index, index)
    end

    return password
end

local function ler()
    return io.read("*number")
end

local function msglen(msg1)
    io.write(msg1)
    return ler()
end

local function msginc(msg)
    io.write(("Incluir %s? Digite 1 para SIM ou qualquer outro caracter para NÃO: "):format(msg))
    return ler() == 1
end

-- Interface CLI
print("Gerador de Senhas Seguras em Lua")
local length = msglen "Insira o comprimento da senha: "
local includeSpecial = msginc "caracteres especiais"
local includeNumbers = msginc "números"

print("Senha gerada: " .. generatePassword(length, includeSpecial, includeNumbers)) -- Gera e exibe a senha
