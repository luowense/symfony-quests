<?php

namespace App\Controller;

use App\Entity\Category;
use App\Form\CategoryType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class CategoryController extends AbstractController
{
    /**
     * @Route("form", name="wild_form")
     */

    public function renderForm(Request $request)
    {
        $form = $this->createForm(

            CategoryType::class,

            null,

            ['method' => Request::METHOD_GET]

        );

        $category = new Category();

        $form = $this->createForm(CategoryType::class, $category);

        $form->handleRequest($request);

        if ($form->isSubmitted()) {

            $data = $form->getData();

            $em = $this->getDoctrine()
                ->getManager();

            $category = new Category();

            $em->persist($category->setName($data->getName()));
            $em->flush();
            $this->redirectToRoute('default');

        }
        return $this->render(

            'wild/form.html.twig', [
                'form' => $form->createView(),
            ]
        );
    }
}
