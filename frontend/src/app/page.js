import Link from 'next/link';

export default function Home() {
  return (
    <main className="container">
      <nav className="navbar">
        <div className="logo">Hotel M</div>
        <div className="nav-links">
          <Link href="/signin" className="btn btn-outline">Sign In</Link>
          <Link href="/signup" className="btn btn-primary">Sign Up</Link>
        </div>
      </nav>

      <section className="hero">
        <div className="hero-content">
          <h1>Experience Luxury and Comfort</h1>
          <p>Book your stay at the most exquisite hotels and enjoy world-class amenities and services tailored just for you.</p>
          <div className="hero-actions">
            <Link href="/rooms" className="btn btn-lg btn-primary">Book Now</Link>
            <Link href="/explore" className="btn btn-lg btn-outline">Explore Rooms</Link>
          </div>
        </div>
        <div className="hero-image">
          <img src="/hero.png" alt="Luxurious Hotel Lobby" className="hero-img-main" />
        </div>
      </section>

      <section className="features">
        <div className="feature">
          <h3>Premium Suites</h3>
          <p>Indulge in our spacious and elegantly designed suites with breathtaking views.</p>
        </div>
        <div className="feature">
          <h3>Gourmet Dining</h3>
          <p>Savor exquisite dishes prepared by our world-renowned chefs using the finest ingredients.</p>
        </div>
        <div className="feature">
          <h3>Wellness & Spa</h3>
          <p>Rejuvenate your mind, body, and soul at our state-of-the-art wellness center and spa.</p>
        </div>
      </section>

      <footer className="footer">
        <p>&copy; 2026 Hotel M. All rights reserved.</p>
      </footer>
    </main>
  );
}
