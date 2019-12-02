<?php

namespace App\DataFixtures;

use App\Entity\Season;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Faker;
class SeasonFixtures extends Fixture implements DependentFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $faker  =  Faker\Factory::create('en_US');
        for ($i = 1; $i <= 50; $i++) {
            $season = new Season();
            $season->setDescription("Season_" . $i);
            $season->setNumber($i);
            $season->setYear($faker->year($max = 'now'));
            $season->setProgram($this->getReference("program_" . rand(0, 5)));

            $this->addReference("Season_" . $i, $season);
            $manager->persist($season);
        }

        $manager->flush();
    }
    public function getDependencies()
    {
        return [ProgramFixtures::class];
    }
}
