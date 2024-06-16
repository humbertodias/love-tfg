local StateMachine = Class:extend()

function StateMachine:init(states)
    self.empty = {
        draw = function() end,
        update = function() end,
        enter = function() end,
        exit = function() end
    }
    self.states = states or {}
    self.current = self.empty
    self.currentStateName = nil
end

function StateMachine:change(stateName, enterParams)
    assert(self.states[stateName]) -- state must exist!
    self.current:exit()
    self.current = self.states[stateName]
    self.current:enter(enterParams)
    self.currentStateName = stateName -- Track the current state name
end

function StateMachine:update(dt)
    self.current:update(dt)
end

function StateMachine:render()
    self.current:render()
end

function StateMachine:mousepressed(x, y, button)
    self.current:mousepressed(x, y, button)
end

return StateMachine
