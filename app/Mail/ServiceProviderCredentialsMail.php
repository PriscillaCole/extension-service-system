<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ServiceProviderCredentialsMail extends Mailable
{
    use Queueable, SerializesModels;

    public $credentials;
    public $provider;

    /**
     * Create a new message instance.
     *
     * @param $credentials
     * @param $farmer
     */
    public function __construct($credentials, $provider)
    {
        $this->credentials = $credentials;
        $this->provider = $provider;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Welcome! Your Account Credentials')
                    ->view('emails.provider_credentials')
                    ->with([
                        'credentials' => $this->credentials,
                        'provider' => $this->provider,
                    ]);
    }
}
