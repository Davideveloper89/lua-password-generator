local ler = io.read
math.randomseed(os.time())
-- Função para gerar uma senha segura
function generatePassword(length, useSpecial, useNumbers)
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local specialChars = "!@#$%^&*()-_=+<>?"
    local numbers = "0123456789"

    if useSpecial then chars = chars .. specialChars end
    if useNumbers then chars = chars .. numbers end

    local password = ""
    for i = 1, length do
        local index = math.random(1, #chars)
        password = password .. chars:sub(index, index)
    end

    return password
end

function msglen(msg1)
    io.write(msg1)
    return tonumber(ler())
end

function msginc(msg)
    local msg1 = ("Incluir %s? (s/n): "):format(msg)
    io.write(msg1)
    return ler():lower() == "s"
end

-- Interface CLI
print("Gerador de Senhas Seguras em Lua")
local length = msglen "Insira o comprimento da senha:"
local includeSpecial = msginc "caracteres especiais"
local includeNumbers = msginc "números"

print("Senha gerada: " .. generatePassword(length, includeSpecial, includeNumbers)) -- Gera e exibe a senha
