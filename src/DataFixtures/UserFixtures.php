<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class UserFixtures extends Fixture
{
    private $passwordEncoder;

    public function __construct(UserPasswordEncoderInterface $passwordEncoder)
    {
        $this->passwordEncoder = $passwordEncoder;
    }

    public function load(ObjectManager $manager)
    {
        $subscriberAuthor = new User();
        $subscriberAuthor->setEmail('suscriber@monsite.com');
        $subscriberAuthor->setRoles(['ROLE_SUSCRIBERAUTHOR']);
        $subscriberAuthor->setPassword($this->passwordEncoder->encodePassword(
            $subscriberAuthor,
            'subscriberpassword'
        ));
        $manager->persist($subscriberAuthor);

        $admin = new User();
        $admin->setEmail('admin@admin.com');
        $admin->setRoles(['ROLE_ADMIN']);
        $admin->setPassword($this->passwordEncoder->encodePassword(
            $admin,
            'adminpassword'
        ));
        $manager->persist($admin);


        $manager->flush();
    }


    public function getDependencies()
    {
        return [ProgramFixtures::class];
    }
}
