switch current_state
{
	case ESceneState.NonInitialized:
		var customer = instance_create_layer(customer_spawn_pos_x, customer_spawn_pos_y, "Customer", obj_customer);
		customer.current_state = ECustomerState.Entering;
		current_state = ESceneState.CustomerEntering;
		break;
}