<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class CommentaireCourriel extends Mailable
{
    use Queueable, SerializesModels;

    private $commentaire;
    private $ip_adresse;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($commentaire, $ip_adresse)
    {
        $this->commentaire = $commentaire;
        $this->ip_adresse = $ip_adresse;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from($address = 'noreply@thebankofshawinigan.ca', $name = 'TheBankOfShawinigan')
            ->subject('Commentaire')->view('Courriel.commentaire', ['commentaire'=>$this->commentaire, 'ip_adresse'=>$this->ip_adresse]);

    }
}
