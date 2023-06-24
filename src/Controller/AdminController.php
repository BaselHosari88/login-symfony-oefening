<?php

namespace App\Controller;

use App\Entity\Dier;
use App\Form\DierType;
use App\Repository\DierRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    #[Route('/admin', name: 'app_admin')]
    public function index(DierRepository $dierRepository): Response
    {
        $KU = $this->getUser();
        $dieren = $dierRepository->findBy(['user' => $KU]);

        return $this->render('admin/index.html.twig', [
            'controller_name' => 'AdminController',
            'dieren' => $dieren
        ]);
    }

#[Route('/form', name: 'form')]

public function form(Request $request, DierRepository $dierRepository): Response
{

    $task = new Dier();

    /////////
    $KU = $this->getUser();
    $task->setUser($KU);


    ///////

    $form = $this->createForm(DierType::class, $task);

    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {

        $task = $form->getData();


        $dierRepository->save($task);



        return $this->redirectToRoute('app_admin');
    }

    return $this->renderForm('admin/form.html.twig', [
        'form' => $form,
    ]);
}


    #[Route('/delete/{id}', name: 'delete')]
    public function delete(DierRepository $dierRepository ,int $id): Response
    {

        $dier = $dierRepository->find($id);

        $dierRepository->remove($dier);

        return $this->redirectToRoute('app_admin', [
            'controller_name' => 'AdminController',

        ]);
    }



}
