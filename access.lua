-- Some variable declarations.
local uuid = ngx.var.cookie_uuid
local sso = 'http://sso.example.com'
local res

if not uuid then
    ngx.redirect(sso);
end

local redis = require "resty.redis"
local red = redis.new()
red:set_timeout(1000)

local ok, err = red:connect("redis", 6379)
if not ok then
    ngx.say("failed to connect", err)
    return
end

local res, err = red:get(uuid)
if not res then
    ngx.redirect(sso)
end

if res == ngx.null then
    ngx.redirect(sso)
end

ngx.header["uuid"] = null
ngx.req.set_header('X-USER-INFO', res)