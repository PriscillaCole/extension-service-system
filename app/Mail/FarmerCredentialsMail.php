<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class FarmerCredentialsMail extends Mailable
{
    use Queueable, SerializesModels;

    public $credentials;
    public $farmer;

    /**
     * Create a new message instance.
     *
     * @param $credentials
     * @param $farmer
     */
    public function __construct($credentials, $farmer)
    {
        $this->credentials = $credentials;
        $this->farmer = $farmer;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Welcome! Your Farmer Account Credentials')
                    ->view('emails.farmer_credentials')
                    ->with([
                        'credentials' => $this->credentials,
                        'farmer' => $this->farmer,
                    ]);
    }
}
