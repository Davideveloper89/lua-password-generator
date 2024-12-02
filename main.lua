-- Função para gerar uma senha segura
function generatePassword(length, useSpecial, useNumbers)
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local specialChars = "!@#$%^&*()-_=+<>?"
    local numbers = "0123456789"

    if useSpecial then
        chars = chars .. specialChars
    end

    if useNumbers then
        chars = chars .. numbers
    end

    local password = ""
    for i = 1, length do
        local index = math.random(1, #chars)
        password = password .. chars:sub(index, index)
    end

    return password
end

-- Interface CLI
print("Gerador de Senhas Seguras em Lua")
print("Insira o comprimento da senha:")
local length = tonumber(io.read())
print("Incluir caracteres especiais? (s/n):")
local includeSpecial = io.read() == "s"
print("Incluir números? (s/n):")
local includeNumbers = io.read() == "s"

-- Gera e exibe a senha
local password = generatePassword(length, includeSpecial, includeNumbers)
print("Senha gerada: " .. password)

