using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerMovement : MonoBehaviour
{
    //setup input Action
    public InputActionAsset InputActions;
    public InputAction moveAction;
    public InputAction jumpAction;
    public InputAction sprintAction;

    //Setup variable pour input
    private Vector2 moveAmount;



    public CharacterController controller;
    public float speed = 12f;

    Vector3 velocity;
    bool isGrounded;
    float gravity = -9.81f;

    public Transform groundcheck;
    public float grounddistance = 0.04f;
    public LayerMask groundMask;

    public float gravityMultiplyier = 1f;
    public float jumpHeight = 3f;

    bool sprinting = false;
    public float sprintMultiplyier = 2f;

    //Activer le systeme d'input du joueur
    private void OnEnable ()
    {
        InputActions.FindActionMap("Player").Enable();
    }

    private void OnDisable ()
    {
        InputActions.FindActionMap("Player").Disable();
    }

    private void Awake ()
    {
        moveAction = InputSystem.actions.FindAction("Move");
        jumpAction = InputSystem.actions.FindAction("Jump");
        sprintAction = InputSystem.actions.FindAction("Sprint");
    }

    void Update()
    {
        moveAmount = moveAction.ReadValue<Vector2>();


        //isGrounded = Physics.CheckSphere(groundcheck.position,grounddistance, groundMask);
        isGrounded = controller.isGrounded;

        //check Sprint
        if(sprintAction.WasPressedThisFrame())
        {
            sprinting = true;
        }

        if(sprintAction.WasReleasedThisFrame())
        {
            sprinting = false;
        }

        //quand on touche le sol, ralentis le joueur
        if(isGrounded && velocity.y < 0)
        {
            velocity.y = -2f;
        }
        
        //mouvement de base
        Vector3 move = transform.right * moveAmount.x + transform.forward * moveAmount.y;

        if(sprinting == true)
        {
            controller.Move(move * speed * Time.deltaTime * sprintMultiplyier);
        }

        else
        {
            controller.Move(move * speed * Time.deltaTime);
        }
        

        //jump
        if(jumpAction.WasPressedThisFrame() && isGrounded)
        {
            velocity.y = Mathf.Sqrt(jumpHeight * -2f * gravity);
            RumbleManager.instance.RumblePulse(0f, 1f, 0.05f);
        }

        velocity.y += gravity * gravityMultiplyier * Time.deltaTime;
        controller.Move(velocity * Time.deltaTime);

    }
}
