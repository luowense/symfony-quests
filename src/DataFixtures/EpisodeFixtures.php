<?php

namespace App\DataFixtures;

use App\Entity\Episode;
use App\Service\Slugify;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Faker;
class EpisodeFixtures extends Fixture implements DependentFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $faker  =  Faker\Factory::create('en_US');
        for ($i = 1; $i <= 500; $i++) {
            $slugify = new Slugify();
            $episode = new Episode();
            $episode->setNumber($faker->randomDigitNotNull());
            $episode->setTitle("Hello " . $faker->word());
            $episode->setSlug($slugify->generate($episode->getTitle()));
            $episode->setSeason($this->getReference("Season_" . rand(1,50)));
            $episode->setSynopsis($faker->sentence($nbWords = 6, $variableNbWords = true));
            $manager->persist($episode);
        }
        $manager->flush();
    }
    public function getDependencies()
    {
        return [SeasonFixtures::class];
    }
}
