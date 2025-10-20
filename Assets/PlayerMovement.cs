using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
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

 

    void Update()
    {
        //isGrounded = Physics.CheckSphere(groundcheck.position,grounddistance, groundMask);
        isGrounded = controller.isGrounded;

        //check Sprint
        if(Input.GetButtonDown("Sprint"))
        {
                sprinting = true;
        }

        if(Input.GetButtonUp("Sprint"))
        {
                sprinting = false;
        }

        //quand on touche le sol, ralentis le joueur
        if(isGrounded && velocity.y < 0)
        {
            velocity.y = -2f;
        }
        
        //mouvement de base
        float x = Input.GetAxis("Horizontal");
        float z = Input.GetAxis("Vertical");

        Vector3 move = transform.right * x + transform.forward * z;

        if(sprinting == true){
            controller.Move(move * speed * Time.deltaTime * sprintMultiplyier);
        }
        else {
            controller.Move(move * speed * Time.deltaTime);
        }
        

        //jump
        if(Input.GetButtonDown("Jump") && isGrounded)
    {
        velocity.y = Mathf.Sqrt(jumpHeight * -2f * gravity);
    }

        velocity.y += gravity * gravityMultiplyier * Time.deltaTime;
        controller.Move(velocity * Time.deltaTime);

    }
}
