function love.load()
    -- Window Title And Icon
    windowIcon = love.image.newImageData("Assets/target.png")
    love.window.setIcon(windowIcon)
    love.window.setTitle("AimTrainer")

    -- Fps
    sleep = 0

    -- Target Vars
    target = {}
    target.sprite = love.graphics.newImage("Assets/target.png")
    target.x = 400
    target.y = 300

    -- Score Vars
    score = 0

    -- Game Font
    game_font = love.graphics.newFont("Assets/SpeedyRegular-7BLoE.ttf", 50)

    -- Game Audio
    bg_music = love.audio.newSource("Assets/bgmusic.wav", "stream")
    bg_music:setLooping(true)
    bg_music:setVolume(0.45)
    player_music = love.audio.newSource("Assets/playersound.wav", "stream")
    love.audio.play(bg_music)
    
end

function love.update(dt)
    love.timer.sleep(sleep)

    if love.timer.getFPS()>=60 then
      sleep = sleep + 0.0001
    end
end

function love.draw()
    -- Background
    love.graphics.setColor(1, 0.804, 0.431)
    love.graphics.rectangle("fill", 0, 0, 800, 600)

    -- Target
    love.graphics.draw(target.sprite, target.x, target.y, 0, 0.35, 0.35, 150, 150)

    -- Score And Timer
    love.graphics.setColor(0.302, 0.302, 0.302)
    love.graphics.setFont(game_font)
    love.graphics.print(score, 230, 3)
    love.graphics.print("Score : ", 0, 0)
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        local mouseToTarget = distanceCalculate(x, y, target.x, target.y)
        if mouseToTarget < 50 then
            score = score + 1
            target.x = math.random(0, 800)
            target.y = math.random(0, 600)
            love.audio.play(player_music)
        end
    end
end

function distanceCalculate(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end
