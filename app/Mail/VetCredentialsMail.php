<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class VetCredentialsMail extends Mailable
{
    use Queueable, SerializesModels;

    public $credentials;
    public $vet;

    /**
     * Create a new message instance.
     *
     * @param $credentials
     * @param $farmer
     */
    public function __construct($credentials, $vet)
    {
        $this->credentials = $credentials;
        $this->vet = $vet;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Welcome! Your Vet Account Credentials')
                    ->view('emails.vet_credentials')
                    ->with([
                        'credentials' => $this->credentials,
                        'vet' => $this->vet,
                    ]);
    }
}
