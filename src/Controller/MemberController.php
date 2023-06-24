<?php

namespace App\Controller;

use App\Repository\DierRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MemberController extends AbstractController
{
    #[Route('/member', name: 'app_member')]
    public function index( DierRepository $dierRepository, UserRepository $userRepository): Response
    {
        $dieren  = $dierRepository->findAll();


        return $this->render('member/index.html.twig', [
            'controller_name' => 'MemberController',
            'dieren' => $dieren
        ]);
    }
}
