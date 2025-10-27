using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using DG.Tweening;

public class PlayerMovement : MonoBehaviour
{
    //setup input Action
    public InputActionAsset InputActions;
    public InputAction moveAction;
    public InputAction jumpAction;
    public InputAction sprintAction;

    //Setup variable pour input
    private Vector2 moveInput;


    // Setup Animator
    public Animator cameraAnimator;
    public Ease cameraAnimationEase;
    private float animatorSpeed;
    private float speedBuffer;


    public CharacterController controller;
    public float speedmultiplyier = 12f;

    Vector3 verticalVelocity;
    Vector3 horizontalVelocity;

    bool isGrounded;
    bool jumping;
    float gravity = -9.81f;
    Vector3 airVelocity;
    public float aircontrol = 0.001f;
    private float airSpeedLimit = 0f;

    // coyote time
    public float coyoteTime = 0.2f;
    private float coyoteTimeCounter;

    // jump buffer
    public float jumpBufferTime = 0.2f;
    private float jumpBufferCounter;

    //Jump charge
    public float jumpCharge;
    private float jumpChargeCounter;
    public bool isChargingJump = false;
    private float jumpChargeAnimator;

    public Transform groundcheck;
    public float grounddistance = 0.04f;
    public LayerMask groundMask;

    public float gravityMultiplyier = 1f;
    public float jumpHeight = 3f;

    bool sprinting = false;
    public float sprintMultiplyier = 2f;
    private float speedMultiplyierBuffer;

    //Activer le systeme d'input du joueur
    private void OnEnable ()
    {
        InputActions.FindActionMap("Player").Enable(); //activer le systeme d'input du joueur
    }

    private void OnDisable ()
    {
        InputActions.FindActionMap("Player").Disable();//desactiver le systeme d'input du joueur
    }

    private void Awake ()
    {
        moveAction = InputSystem.actions.FindAction("Move"); 
        jumpAction = InputSystem.actions.FindAction("Jump");
        sprintAction = InputSystem.actions.FindAction("Sprint");
    }

    void Update()
    {
        moveInput = moveAction.ReadValue<Vector2>(); //recuperer la valeur de l'input de deplacement

        CheckJump();


        if (isGrounded && verticalVelocity.y < 0) {

            if (jumping == true) 
            {
                jumping = false;

                RumbleManager.instance.RumblePulse(0.5f, 0.5f, 0.1f);
            }
            verticalVelocity.y = -2f;

            //print(jumping);
        }

        //check Sprint
        if (sprintAction.WasPressedThisFrame())
        {
            sprinting = true;
        }

        if(sprintAction.WasReleasedThisFrame())
        {
            sprinting = false;
        }
        


        Walking();
        Jump();
    }

    private void CheckJump()
    {

        isGrounded = controller.isGrounded;//check si le joueur est au sol
        if (isGrounded)
        {
            coyoteTimeCounter = coyoteTime; //reset le compteur de coyote time
        }
        else
        {
            coyoteTimeCounter -= Time.deltaTime; //decremente le compteur de coyote time
        }

        if (isChargingJump == true)
        {
            DOTween.To(() => jumpChargeAnimator, x => jumpChargeAnimator = x, 1f, 0.001f);
        }

        else         {
            DOTween.To(() => jumpChargeAnimator, x => jumpChargeAnimator = x, 0f, 0.01f);
        }

        cameraAnimator.SetFloat("jumpCharge", jumpChargeAnimator); //mettre a jour la valeur de l'animator

    }

    private void Jump()
    {
        if (jumpAction.WasPressedThisFrame()) {
            jumpChargeCounter = 0f;
            isChargingJump = true;
        }


        if (jumpAction.WasReleasedThisFrame())
        {
            isChargingJump = false;
            jumpBufferCounter = jumpBufferTime; //reset le compteur de jump buffer
        }
        else
        {
            jumpBufferCounter -= Time.deltaTime; //decremente le compteur de jump buffer
        }

        if (jumpBufferCounter > 0 && coyoteTimeCounter > 0f) { // jump
            jumping = true;
            verticalVelocity.y = Mathf.Sqrt(jumpHeight * -2f * gravity * Mathf.Clamp((jumpChargeCounter / jumpCharge)*0.75f +0.25f, 0f, 1f)); //calculer le saut
            airSpeedLimit = horizontalVelocity.magnitude;
            airVelocity = horizontalVelocity;
            coyoteTimeCounter = 0f; //empêcher les sauts multiples pendant le coyote time
        }

        jumpChargeCounter += Time.deltaTime;
        //print(Mathf.Clamp(jumpChargeCounter / jumpCharge, 0f, 1f));
        verticalVelocity.y += gravity * gravityMultiplyier * Time.deltaTime; //appliquer la gravité
    }
    private void Walking() //fonction de deplacement
    {

        if (isGrounded == true) //si on est au sol
        {
            horizontalVelocity = transform.right * moveInput.x + transform.forward * moveInput.y; //calculer la direction du mouvement
        }

        else //si on est en l'air
         {
            // appliquer le contrôle aérien (delta)
            Vector3 controlDelta = transform.right * moveInput.x * aircontrol + transform.forward * moveInput.y * aircontrol;
            Vector3 newAir = horizontalVelocity + controlDelta;

            // Empêcher l'accélération au-delà de la vitesse initiale du saut.
            // Autorise la décélération (réduction de magnitude), mais clamp la magnitude maximale à airSpeedLimit.
            if (newAir.magnitude > airSpeedLimit) {
                // Si airSpeedLimit est 0 => cela empêchera toute accélération horizontale après un saut depuis l'immobilité.
                newAir = newAir.normalized * airSpeedLimit;
            }

            horizontalVelocity = newAir;
        }

        if (sprinting == true && isGrounded == true) //si on sprint
            {
            DOTween.To(() => speedBuffer, x => speedBuffer = x, sprintMultiplyier, 1f);
            DOTween.To(() => animatorSpeed, x => animatorSpeed = x, 1f, 1);
        }

        else if (isGrounded== true) {
            if (Mathf.Abs(moveInput.y) < 0.1 && Mathf.Abs(moveInput.x) < 0.1) { //si on arrete de bouger
                DOTween.To(() => speedBuffer, x => speedBuffer = x, 0, 1f);
                DOTween.To(() => animatorSpeed, x => animatorSpeed = x, 0f, 1);
            }

            else { //si on marche normalement
                DOTween.To(() => speedBuffer, x => speedBuffer = x, 1f, 1f);
                DOTween.To(() => animatorSpeed, x => animatorSpeed = x, 0.5f, 1);
            }

        }

        cameraAnimator.SetFloat("Speed", animatorSpeed); //mettre a jour la valeur de l'animator

        controller.Move(horizontalVelocity * speedmultiplyier * Time.deltaTime * speedBuffer + verticalVelocity * Time.deltaTime); //appliquer le mouvement avec la vitesse
    }
}
