using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RotateForever : MonoBehaviour {
	public bool isRotating;
	public Vector3 Speed;
	public float RestTime;

	void Start(){
		isRotating = false;
		if (RestTime != 0.0f) {
			StartCoroutine (Rotate (RestTime));
		}
	}

	IEnumerator Rotate(float tim){
		while (true) {
			isRotating = !isRotating;
			yield return new WaitForSeconds (tim);
		}

	}

	// Update is called once per frame
	void FixedUpdate () {
		if (isRotating) {
			transform.Rotate (Speed);			
		} else {
			transform.Rotate (Speed / 3);
		}
	}
}
