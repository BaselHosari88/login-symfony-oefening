<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class AnimalController extends AbstractController
{
    #[Route('/', name: 'app_animal')]
    public function index(): Response
    {
        return $this->render('animal/index.html.twig', [
            'controller_name' => 'AnimalController',
        ]);
    }

    #[Route('/logout', name: 'logout')]
    public function logout  () : Response
    {
       throw new Exception('Don not\'forget to activete logout in security');

    }
    #[Route('/login', name: 'app_login')]
    public function login ( AuthenticationUtils $authenticationUtils) : Response
    {
        $error = $authenticationUtils->getLastAuthenticationError();

        $lastUsername = $authenticationUtils->getLastUsername();
        return $this->render('animal/login.html.twig',[
            'last_username' => $lastUsername,
            'error' => $error,

        ]);


    }

    #[Route('/redirect', name: 'redirect')]
    public function redirectAction  (Security $security)
    {

        if($security->isGranted('ROLE_ADMIN')){
            return $this->redirectToRoute('app_admin');
        }

        if($security->isGranted('ROLE_MEMBER')){
            return $this->redirectToRoute('app_member');
        }
        return $this->redirectToRoute('app_animal');


    }




}
