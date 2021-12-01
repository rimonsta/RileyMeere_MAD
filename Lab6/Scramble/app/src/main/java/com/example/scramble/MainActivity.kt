package com.example.scramble

import android.os.Bundle
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    lateinit var editGuess: EditText
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        editGuess = findViewById(R.id.editTextTextCapSentence)
    }

    fun guessAnswer(view: android.view.View) {
        val usersGuess = findViewById<EditText>(R.id.editTextTextCapSentence)
        val usersGuessString = usersGuess.text.toString()
        val usersGuessStringCaps = usersGuessString.uppercase()
        val unscrambled: String = getString(R.string.unscrambledSentence)
        val guessCheck = findViewById<TextView>(R.id.messageView)
        val scrambleSentence = findViewById<TextView>(R.id.textView)
        val featuredImage = findViewById<ImageView>(R.id.imageView)

        if (usersGuessStringCaps == unscrambled) {
            guessCheck.text = "What a great fall!"
            scrambleSentence.text = unscrambled
            featuredImage.setImageResource(R.drawable.great_fall_good)
        }
        else {
            guessCheck.text = "Uh oh... try again?"
            featuredImage.setImageResource(R.drawable.great_fall_bad)
        }
    }
}
