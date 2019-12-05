<?php

namespace App\DataFixtures;

use App\Entity\Category;
use App\Service\Slugify;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class CategoryFixtures extends Fixture
{
    const CATEGORIES = [
        "Action",
        "Aventure",
        "Animation",
        "Fantastic",
        "Horror",
    ];
    public function load(ObjectManager $manager)
    {
        foreach(self::CATEGORIES as $key => $categoryName){
            $category = new Category();
            $slugify = new Slugify();
            $category->setName($categoryName);
            $category->setSlug($slugify->generate($category->getName()));
            $manager->persist($category);
            $this->addReference('category_' . $key, $category);
        }
        $manager->flush();
    }
}
