using UnityEngine;
using UnityEngine.InputSystem;
using System.Collections;

public class InventoryManager : MonoBehaviour
{
    public InputActionAsset InputActions;
    public InputAction torchAction;
    public InputAction jumellesAction;

    public GameObject torchObject;
    public GameObject jumellesObject;
    private GameObject currentObjet;

    public Animator cameraAnimator;

    public float rangementSpeed = 1f;

    public bool hasTorch;
    public bool hasJumelles;



    private void OnEnable() {
        InputActions.FindActionMap("Player").Enable(); //activer le systeme d'input du joueur
    }

    private void OnDisable() {
        InputActions.FindActionMap("Player").Disable();//desactiver le systeme d'input du joueur
    }

    private void Awake() {
        torchAction = InputSystem.actions.FindAction("Torch");
        jumellesAction = InputSystem.actions.FindAction("Jumelles");
    }


    void Start()
    {
        
    }


    void Update() {

        // TORCHE
        if (hasTorch == true) 
        {
            if (torchAction.WasReleasedThisFrame() && currentObjet != torchObject) {
                StartCoroutine(switchObjet(currentObjet, torchObject));
            }

            else if (torchAction.WasReleasedThisFrame() && currentObjet == torchObject) {
                StartCoroutine(switchObjet(torchObject, null));
            }

        }
        // JUMELLES
        if (hasJumelles == true) 
        {
            if (jumellesAction.WasReleasedThisFrame() && currentObjet != jumellesObject) {
                StartCoroutine(switchObjet(currentObjet, jumellesObject));
            }

            else if (jumellesAction.WasReleasedThisFrame() && currentObjet == jumellesObject) {
                StartCoroutine(switchObjet(jumellesObject, null));
            }
        }

    }


    IEnumerator switchObjet(GameObject oldObject, GameObject newObject) {
        // Ranger l'ancien objet

        if (oldObject != null) {
            cameraAnimator.SetBool("ObjetSorti", false); //lancer l'animation de rangement
            yield return new WaitForSeconds(rangementSpeed); //attendre la fin de l'animation
            oldObject.SetActive(false); //desactiver l'ancien objet
            currentObjet = null; //indique qu'aucun objet n'est actuellement sorti
        }

        //Sortir le nouvel objet seulement s'il y en a un
        if (newObject != oldObject && newObject != null) {
            newObject. SetActive(true); //activer le nouvel objet
            cameraAnimator.SetBool("ObjetSorti", true);//   lancer l'animation de sortie
            currentObjet = newObject; //mettre a jour l'objet actuellement sorti
        }

    }
}
