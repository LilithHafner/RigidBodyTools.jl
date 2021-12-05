export DirectlySpecifiedMotion, BasicDirectMotion

abstract type DirectlySpecifiedMotion <: AbstractMotion end

struct BasicDirectMotion{VT} <: DirectlySpecifiedMotion
    u :: VT
    v :: VT
end


"""
    assign_velocity!(u::AbstractVector{Float64},v::AbstractVector{Float64},
                     x::AbstractVector{Float64},y::AbstractVector{Float64},
                     motion::BasicDirectMotion,t::Real)

Assign the components of velocity `u` and `v` (in inertial coordinate system)
at positions described by coordinates `x`, `y` (also in inertial coordinate system) at time `t`,
based on supplied motion `motion` for the body.
"""
function assign_velocity!(u::AbstractVector{Float64},v::AbstractVector{Float64},
                          x::AbstractVector{Float64},y::AbstractVector{Float64},
                          m::BasicDirectMotion,t::Real)

  u .= m.u
  v .= m.v
  return u, v
end

"""
    assign_velocity(x::AbstractVector{Float64},y::AbstractVector{Float64},
                    motion::BasicDirectMotion,t::Real)

Return the components of velocities (in inertial components) at positions
described by coordinates `x`, `y` (also in inertial coordinate system) at time `t`,
based on supplied motion `motion` for the body.
"""
assign_velocity(x::AbstractVector{Float64},y::AbstractVector{Float64},
                m::BasicDirectMotion,t::Real) =
                assign_velocity!(similar(x),similar(y),x,y,m,t)
