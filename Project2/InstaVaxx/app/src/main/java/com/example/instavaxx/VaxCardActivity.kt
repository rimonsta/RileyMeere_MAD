package com.example.instavaxx

import android.content.Intent
import android.media.MediaPlayer
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView
import com.google.android.material.floatingactionbutton.FloatingActionButton

class VaxCardActivity : AppCompatActivity() {
    private var userFullName: String? = null
    lateinit var fullName: TextView
    lateinit var infoFab: FloatingActionButton

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_vax_card)

        // change action bar to drawable gradient
        // code help: https://www.geeksforgeeks.org/how-to-set-gradient-and-image-backgrounds-for-actionbar-in-android/
        supportActionBar?.setBackgroundDrawable(resources.getDrawable(R.drawable.app_bar_gradient))

        fullName = findViewById(R.id.fullNameTextView)
        userFullName = intent.getStringExtra("userFullName")
        userFullName?.let { fullName.text = "$userFullName" }

        // create media player and play immediately
        // code help: https://www.youtube.com/watch?v=DaLPIC4NbYU
        val mediaPlayer = MediaPlayer.create(this, R.raw.instavaxx)
        mediaPlayer.start()

        infoFab = findViewById(R.id.fab)
        infoFab.setOnClickListener{
            loadWebSite()
        }
    }

    private fun loadWebSite(){
        val infoURL: String = getString(R.string.infoURL)

        //create intent
        var intent = Intent()
        intent.action = Intent.ACTION_VIEW
        intent.data =  infoURL?.let{ Uri.parse(infoURL)}
        startActivity(intent)
    }
}