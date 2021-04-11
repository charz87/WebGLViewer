using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraHandler : MonoBehaviour {

    [SerializeField]
    private GameObject[] sceneCameras;

    public void ChangeCamera(int cameraID)
    {
        if (Camera.main.name != sceneCameras[cameraID].name)
        {
            Camera myCamera = Camera.main;
            myCamera.tag = "Camera";
            sceneCameras[cameraID].SetActive(true);
            sceneCameras[cameraID].tag = "MainCamera";
            sceneCameras[cameraID].transform.parent.GetComponent<MouseDragRotation>().enabled = true;
            myCamera.transform.parent.GetComponent<MouseDragRotation>().enabled = false;
            myCamera.gameObject.SetActive(false);
        }
    }
}
