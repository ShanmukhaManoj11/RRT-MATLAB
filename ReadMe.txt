1. “main.m”
Implements RRT on the robot with given size and maximum allowable step it can take to reach the next valid node
2. “update_robot_position.m”
Given the center of the robot and its orientation i.e. the robot’s configuration, this results in the four corners of the rectangle shaped robot to update its position by plotting on the map
3. “RRT_new.m”
RRT algorithm
4. “edge_collision.m”
Returns 1 if there is a collision of any robot edge and 0 if there is no collision
5. “is_valid_configuration.m”
Check whether a given configuration belongs to C_free (is valid or not)
6. “nearest.m”
Outputs the nearest neighbor of the node that belongs to the tree given a randomly generated node on the map
7. “stopping_configuration.m”
Outputs the valid node (configuration) which is at a distance less than or equal to the maximum allowable robot step size and lies along the line joining the randomly generated node and the nearest neighbor found

