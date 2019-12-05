<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Program;
use App\Entity\Season;
use App\Entity\Episode;
use App\Entity\Actor;
use App\Service\Slugify;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class WildController extends AbstractController
{
    /**
     * @Route("/", name="default")
     */
    public function index()
    {
        $programRepository = $this->getDoctrine()
            ->getManager()
            ->getRepository(Program::class);

        $programs = $programRepository->findAll();

        return $this->render('default/index.html.twig', [
            'programs' => $programs
        ]);
    }

    /**
     * @Route("/show/{slug}", name="wild_show")
     * @param $slug
     */
    public function show($slug)
    {
        if (!$slug) {
            throw $this
                ->createNotFoundException('No slug gas been sent to fin a program in program\'s table.');
        }

        $slug = preg_replace(
            '/-/',
            ' ', ucwords(trim(strip_tags($slug)), '-')
        );

        $program = $this->getDoctrine()
            ->getRepository(Program::class)
            ->findOneBy(['title' => mb_strtolower($slug)]);


        $seasons = $this->getDoctrine()
            ->getRepository(Season::class)
            ->findOneBy(['program' => $program->getId()]);

        $actors = $program->getActors();

        if (!$program) {
            throw $this->createNotFoundException(
                'No program with ' . $slug . ' title, found in program\'s table.'
            );
        }
        return $this->render('Wild/show.html.twig', [
            'program' => $program,
            'seasons' => $seasons,
            'actors' => $actors
        ]);
    }

    /**
     * @Route("/category/{category}", name="show_category")
     * @param $category
     * @return Response
     */
    public function showByCategory($category)
    {
        $programByCategory = '';
        $repository = $this->getDoctrine()
            ->getManager()
            ->getRepository(Program::class);
        $repositoryCategory = $this->getDoctrine()
            ->getManager()
            ->getRepository(Category::class);
        $cat = $repositoryCategory->findOneBy(['name' => $category]);
        if ($category !=  $cat->getName() || empty($category)) {
            throw $this->createNotFoundException(
                'No category found in program\'s table.'
            );
        }
        if ($category == $cat->getName()) {
            $programByCategory = $repository->findBy(array('category' => 1,), array('id' => 'desc'), 3, 0 );
        }
        return $this->render('Wild/category.html.twig', [
            'programs' => $programByCategory,
        ]);
    }

    /**
     * @Route("wild/program/{slug}", name="program_show")
     */
    public function showByProgram($slug)
    {
        if (!$slug) {
            throw $this
                ->createNotFoundException('No slug gas been sent to fin a program in program\'s table.');
        }
        $slug = preg_replace(
            '/-/',
            ' ', ucwords(trim(strip_tags($slug)), '-')
        );
        $program = $this->getDoctrine()
            ->getRepository(Program::class)
            ->findOneBy(['title' => mb_strtolower($slug)]);

        if (!$program) {
            throw $this->createNotFoundException(
                'No program with ' . $slug . ' title, found in program\'s table.'
            );
        }
        return $this->render('Wild/program.html.twig', [
            'program' => $program,
            'slug' => $slug,
        ]);
    }

    /**
     * @Route("season/{slug}", name="show_season")
     * @return Response
     */
    public function showBySeason(Season $season)
    {

        $seasonRepository = $this->getDoctrine()
            ->getManager()
            ->getRepository(Season::class);

        $finalSeason = $seasonRepository->findBy(['program' => $season->getProgram()]);

        if (!empty($finalSeason))
        {
            return $this->render('Wild/season.html.twig', [
                'seasons' => $finalSeason,
            ]);
        }
        else
        {
            return $this->render('Wild/season.html.twig');
        }
    }

    /**
     * @Route("episodes/{id}", name="allepisodes_show")
     * @return Response
     */
    public function showAllEpisodes($id)
    {
        $episodeRepository = $this->getDoctrine()
            ->getManager()
            ->getRepository(Episode::class)
            ->findBy(['season' => $id]);

        return $this->render('Wild/all_episodes.html.twig', [
           'episodes' => $episodeRepository
        ]);
    }

    /**
     * @Route("episode/{slug}", name="episode_show")
     * @param Episode $episode
     * @return Response
     */
    public function showEpisode(Episode $episode)
    {
        $season = $episode->getSeason();
        $program = $season->getProgram();
        return $this->render('Wild/episode.html.twig', [
            'episode' => $episode,
            'program' => $program,
        ]);
    }

    /**
     * @Route("actor/{slug}", name="show_actor")
     * @param Actor $actor
     * @return Response
     */
    public function showActor(Actor $actor)
    {
        $actorRepository = $this->getDoctrine()
            ->getManager()
            ->getRepository(Actor::class)
            ->findOneBy(['name' => $actor->getName()]);

        $movies = $actorRepository->getPrograms();

        return $this->render('wild/actor.html.twig', [
            'actor' => $actorRepository,
            'movies' => $movies
        ]);
    }

    /**
     * @Route("all-actors/", name="show_all_actors")
     */
    public function showAllActors()
    {
        $actorsRepository = $this->getDoctrine()
            ->getManager()
            ->getRepository(Actor::class)
            ->findAll();

        return $this->render('wild/all_actor.html.twig', [
            'actors' => $actorsRepository
        ]);
    }
}

